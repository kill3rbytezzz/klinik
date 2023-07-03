var express = require('express');
var app = express();
var fetch = require('isomorphic-fetch');
var db = require('./conn');
var port = 3000

app.use(express.json({extended: false}));

app.get('/kandidat', (req, res) => {
    let sql = "SELECT kandidat.id, users.nama, Jabatan.jabatan, users.avatar from kandidat INNER JOIN users on kandidat.user_id=users.id LEFT JOIN Jabatan on kandidat.jabatan = Jabatan.id;";
    db.query(sql, (err, result) => {
        if (err) {
            res.status(500).json({error: "Server Error"});
        } else {
            res.json(result);
        }
    });
});

app.post('/signup', async (req, res) => {
    const {username, email, password} = req.body
    const sql = 'INSERT INTO `pasien` (`id_pasien`, `NIK`, `username`, `password`, `email`, `nama`,`Jenis_Kelamin`, `alamat`, `no_hp`) VALUES (NULL, NULL, ?, ?, ?, NULL, NULL, NULL, NULL)'
    db.query(sql, [username, password, email], (error) => {
        if (error) {
            console.error('Error inserting data:', error);
            res.status(500).json({ message: 'Error inserting data' });
          } else {
            console.log('Data inserted successfully');
            res.status(200).json({ message: 'Data inserted successfully' });
          }
    })

})

app.post('/register', async (req, res) => {
    const {id, NIK, nama, tempatL, jk, tanggalL, alamat} = req.body
    const no_hp = "628123123";
    const sql = "UPDATE `pasien` SET `NIK` = ?, `nama` = ?, `Jenis_Kelamin` = ?, `TempatL` = ?, `TanggalL` = ?, `alamat` = ?, `no_hp` = ?, `registered` = '1' WHERE `pasien`.`id_pasien` = ?"
    db.query(sql, [NIK, nama, jk, tempatL, tanggalL, alamat,  no_hp, id], (error) => {
        if (error) {
            console.error('Error inserting data:', error);
            res.status(500).json({ message: 'Error inserting data' });
          } else {
            console.log('Data inserted successfully');
            res.status(200).json({ message: 'Data inserted successfully' });
          }
    })

})

app.post('/reservasi', async (req, res) => {
    const {id, keluhan, poli, tanggal, jam, menit} = req.body
    const sql = "INSERT INTO `reservasi` (`reservasi_id`, `pasien_id`, `poli_id`, `keluhan`, `tanggal`,`jam`,`menit`, `status`) VALUES (NULL, ?, ?, ?, ?, ?, ?,'1')"
    db.query(sql, [id, poli, keluhan ,tanggal, jam, menit], (error) => {
        if (error) {
            console.error('Error inserting data:', error);
            res.status(500).json({ message: 'Error inserting data' });
          } else {
            console.log('Data inserted successfully');
            res.status(200).json({ message: 'Data inserted successfully' });
          }
    })

})

app.get('/getreservasi', async (req, res) => {
    const sql = "SELECT reservasi.reservasi_id, reservasi.pasien_id, reservasi.poli_id, reservasi.dokter_id, reservasi.keluhan, reservasi.tanggal, reservasi.jam, reservasi.hasil_diagnosa, reservasi.harga, reservasi.status, pasien.NIK, pasien.nama as P_nama, pasien.TanggalL, pasien.no_hp as Pno_hp, pasien.Jenis_Kelamin, dokter.nama AS D_nama, dokter.poli AS D_poli, dokter.no_hp AS Dno_hp FROM `reservasi` LEFT JOIN pasien on reservasi.pasien_id = pasien.id_pasien LEFT JOIN dokter on reservasi.dokter_id = dokter.id_dokter"
    db.query(sql , (error, result) => {
        if (error) {
            console.error('Database error:', error);
            return res.status(500).json({ error: 'Internal server error' });
          }
        if (result.length === 0) {
            return res.status(401).json({ error: 'false'});
        }
        const reservations = result.map((row) => {
            return {
              reservasi_id: row.reservasi_id,
              pasien_id: row.pasien_id,
              poli_id: row.poli_id,
              dokter_id: row.dokter_id,
              keluhan: row.keluhan,
              tanggal: row.tanggal,
              jam: row.jam,
              hasil_diagnosa: row.hasil_diagnosa,
              harga: row.harga,
              NIK: row.NIK,
              P_nama: row.P_nama,
              Jenis_Kelamin: row.Jenis_Kelamin,
              TanggalL: row.TanggalL,
              Pno_hp: row.Pno_hp,
              D_nama: row.D_nama,
              D_poli: row.D_poli,
              Dno_hp: row.Dno_hp
            };
          });
          return res.status(200).json(reservations);
        // return res.status(200).json({reservasi_id: reservasi_id, pasien_id :pasien_id, poli_id:poli_id, dokter_id:dokter_id, keluhan:keluhan, tanggal:tanggal, jam:jam, hasil_diagnosa:hasil_diagnosa, harga:harga, NIK:NIK, P_nama: P_nama, Jenis_Kelamin: Jenis_Kelamin, TanggalL: TanggalL, Pno_hp: Pno_hp, D_nama: D_nama, D_poli: D_poli, Dno_hp: Dno_hp});
    })

})

app.post('/getjadwal', async (req, res) => {
    const {jam, tanggal} = req.body
    console.log(jam, tanggal)
    const sql = "SELECT reservasi.tanggal, reservasi.jam, reservasi.menit from reservasi where reservasi.jam = ? AND reservasi.tanggal = ?"
    db.query(sql,[jam, tanggal] , (error, result) => {
        if (error) {
            console.error('Database error:', error);
            return res.status(500).json({ error: 'Internal server error' });
          }
        if (result.length === 0) {
            return res.status(401).json([]);
        }
        const reservations = result.map((row) => {
            return {
              tanggal: row.tanggal,
              jam: row.jam,
              menit: row.menit,
            };
          });
          return res.status(200).json(reservations);
    })

})

app.post('/profile', async (req, res) => {
    const {id} = req.body;
    let sql = "SELECT pasien.NIK, pasien.nama, pasien.Jenis_Kelamin, pasien.TempatL, pasien.TanggalL, pasien.alamat, pasien.no_hp from pasien WHERE id_pasien = ?";
    db.query(sql, [id], (error,result) => {
        if (error) {
            console.error('Database error:', error);
            return res.status(500).json({ error: 'Internal server error' });
          }
        if (result.length === 0) {
            return res.status(401).json({ error: 'false'});
        }
        const user = result[0]
        const nik= user.NIK;
        const nama = user.nama;
        const Jenis_Kelamin= user.Jenis_Kelamin;
        const tempatL= user.TempatL;
        const TanggalL= user.TanggalL;
        const alamat= user.alamat;
        const no_hp = user.no_hp;

        console.log(tempatL)
        return res.status(200).json({NIK: nik, nama: nama, Jenis_Kelamin: Jenis_Kelamin, tempatL: tempatL, TanggalL: TanggalL, alamat: alamat, no_hp: no_hp });
    })
})

app.post('/checkreg', async (req, res) => {
    const {id} = req.body;
    let sql = "SELECT pasien.username, pasien.id_pasien, pasien.registered, reservasi.status, reservasi.reservasi_id, pasien.nama AS P_nama, reservasi.poli_id, reservasi.tanggal, reservasi.jam, reservasi.menit, reservasi.hasil_diagnosa, poli.nama_poli, dokter.nama AS D_nama from pasien LEFT JOIN reservasi on pasien.id_pasien = reservasi.pasien_id LEFT JOIN poli on reservasi.poli_id = poli.poli_id LEFT JOIN dokter on reservasi.dokter_id = dokter.id_dokter WHERE id_pasien = ?";
    db.query(sql, [id], (error,result) => {
        if (error) {
            console.error('Database error:', error);
            return res.status(500).json({ error: 'Internal server error' });
          }
        if (result.length === 0) {
            return res.status(401).json({ error: 'false'});
        }
        const user = result[result.length - 1]
        const registered= user.registered;
        let status= user.status;
        const reservasi = user.reservasi_id;
        const P_nama = user.P_nama;
        const poli_id = user.poli_id;
        const tanggal = user.tanggal;
        const jam = user.jam;
        const nama_poli = user.nama_poli;
        const D_nama = user.D_nama;
        const diagnosa = user.hasil_diagnosa;
        if (status !== null){
            // console.log(status)
            return res.status(200).json({id: id,registered: registered, status: status, reservasi_id: reservasi, P_nama: P_nama, poli_id: poli_id, tanggal:tanggal, jam:jam, nama_poli:nama_poli, D_nama:D_nama, diagnosa: diagnosa});
        }
        else {
            status = 0;
            // console.log(status)
            return res.status(200).json({id: id,registered: registered, status: status, reservasi_id: reservasi, P_nama: P_nama, poli_id: poli_id, tanggal:tanggal, jam:jam, nama_poli:nama_poli, D_nama:D_nama, diagnosa: diagnosa});
        }

    })
})

        // if wanted to get map value for /checkreg use this
        // const data = result.map((row) => {
        //     return {
        //         id: id,
        //         registered : row.registered,
        //         status : row.status,
        //         reservasi : row.reservasi_id,
        //         P_nama : row.P_nama,
        //         poli_id : row.poli_id,
        //         tanggal : row.tanggal,
        //         jam : row.jam,
        //         menit : row.menit,
        //         nama_poli : row.nama_poli,
        //         D_nama : row.D_nama
        //     };
        //   });
        //   return res.status(200).json(data);

app.post('/poststatus', async (req, res) => {
    const {status, id} = req.body;
    let sql = "UPDATE `reservasi` SET `status` = ? WHERE `reservasi`.`reservasi_id` = ?";
    console.log("status: "+status)
    console.log("id: "+id)
    db.query(sql, [status, id], (error,result) => {
        if (error) {
            console.error('Error inserting data:', error);
            res.status(500).json({ message: 'Error inserting data' });
          } else {
            console.log('Data inserted successfully');
            res.status(200).json({ message: 'Data inserted successfully' });
          }

    })
})

app.post('/login', async (req,res) => {
        const {username, password} = req.body;
        console.log
        let sql = "SELECT pasien.id_pasien, pasien.username, pasien.password, pasien.registered from pasien WHERE username = ?";
        db.query(sql, [username], (error, result) => {
            if (error) {
                console.error('Database error:', error);
                return res.status(500).json({ error: 'Internal server error' });
              }
            if (result.length === 0) {
                return res.status(401).json({ error: 'false'});
            }
            const user = result[0];
            if (password === user.password) {
                const id = user.id_pasien;
                const registered = user.registered;
                return res.status(200).json({message: 'true', id: id, registered: registered})
            }

            return res.status(401).json({ error: 'false'});


        })
})

app.listen(port, () => {
    console.log("Server Running");
});
