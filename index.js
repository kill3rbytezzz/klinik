var express = require('express');
var app = express();
var fetch = require('isomorphic-fetch');
var db = require('./conn');
var port = 3001

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
    const sql = 'INSERT INTO `pasien` (`id_pasien`, `NIK`, `username`, `password`, `email`, `nama`,`Jenis_Kelamin`, `alamat`, `no_hp`, `id_dokter`) VALUES (NULL, NULL, ?, ?, ?, NULL, NULL, NULL, NULL, NULL)'
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
    let sql = "SELECT pasien.username, pasien.id_pasien, pasien.registered from pasien WHERE id_pasien = ?";
    db.query(sql, [id], (error,result) => {
        if (error) {
            console.error('Database error:', error);
            return res.status(500).json({ error: 'Internal server error' });
          }
        if (result.length === 0) {
            return res.status(401).json({ error: 'false'});
        }
        const registered= result[0].registered;
        console.log(registered)
        return res.status(200).json({registered: registered});
    })
})

app.post('/login', async (req,res) => {
        const {username, password} = req.body;
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

