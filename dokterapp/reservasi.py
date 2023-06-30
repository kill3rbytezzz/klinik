import requests
import pandas as pd

response_API = requests.get('http://10.10.10.1:3000/getreservasi')
jsondata = response_API.json()

# Create an empty list to store the reservation data
reservations = []

# Iterate over each reservation and append it to the list
for reservation in jsondata:
    reservations.append(list(reservation.values()))

# Create a DataFrame from the list of reservations
df = pd.DataFrame(reservations, columns=[
    'Reservation ID', 'Pasien ID', 'Poli ID', 'Dokter ID', 'Keluhan', 'Tanggal',
    'Jam', 'Hasil Diagnosa', 'Harga', 'NIK', 'Pasien Nama', 'Jenis Kelamin',
    'Tanggal Lahir', 'Pasien No. HP', 'Dokter Nama', 'Dokter Poli', 'Dokter No. HP'
])

# Print the DataFrame
print(df)
