var mysql = require('mysql');
            var db = mysql.createConnection({
                host: "api.peuhosting.my.id",
                user: "husnul_klinik", //sesuaikan dengan username di laptop km
                password: "husnula123", //sesuaikan dengan password di laptop km
                database: "husnul_klinik" //nama database yang kita buat tadi
            });
            db.connect(function(err) {
                if (err) throw err;
                console.log("Connected!");
            });
            module.exports = db;