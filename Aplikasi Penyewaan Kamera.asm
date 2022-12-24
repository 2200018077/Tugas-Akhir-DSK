
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.code
org 100h
start:
jmp mulai
nama		db 13,10,'Nama Lengkap	: $'
hp		db 13,10,'No. HP/Telp 	: $'
Alamat	db 13,10,'Alamat		: $'
	tampung_nama		db 30,?,30 dup(?)
	tampung_hp			db 13,?,13 dup(?)
	tampung_Alamat		db 30,?,30 dup(?)
	Masukkan db 13,10,'Masukkan No/Kode yang anda pilih : $'
daftar db 13,10,'+=================================================+'
	db 13,10,'|				Penyewaan Kamera	    		 |'
	db 13,10,'|===+====================+========================|'
	db 13,10,'|No | Barang             | Harga/Hari             |'
	db 13,10,'|===|====================|========================|'
	db 13,10,'|01 | Kamera Low Entry   | Rp. 70.000             |'
	db 13,10,'|---|--------------------|------------------------|'
	db 13,10,'|02 | Kamera Medium      | Rp. 90.000             |'
	db 13,10,'|---|--------------------|------------------------|'
	db 13,10,'|03 | Kamera Profesional | Rp. 110.000            |'
	db 13,10,'+=================================================+$'
mulai:
		mov ah,09h
		lea dx,nama
		int 21h
		mov ah,0ah
		lea dx,tampung_nama
		int 21h
		push dx
	mov ah,09h
		lea dx,hp
		int 21h
		mov ah,0ah
		lea dx,tampung_Alamat
		int 21h
		push dx

		mov ah,09h
		mov dx,offset daftar
		int 21h
		mov ah,09h
		jmp proses

error_msg:
		mov ah,09h
		mov dx,offset error_msg
		int 21h
		int 20h

proses:
		mov ah,09h
		mov dx,offset Masukkan
		int 21h

		mov ah,01h
		int 21h
		mov bh,al
		mov ah,01h
		int 21h
		mov bl,al
	int 21h

	cmp bh,'0'
	cmp bl,'1'
		je hasil1

	cmp bh,'0'
	cmp bl,'2'
		je hasil2

	cmp bh,'0'
	cmp bl,'3'
		je hasil3

;--------------------------------------------

hasil1:
		mov ah,09h
		lea dx,teks1
		int 21h
		int 20h

hasil2:
		mov ah,09h
		lea dx,teks2
		int 21h
		int 20h
hasil3:
		mov ah,09h
		lea dx,teks3
		int 21h
		int 20h
;---------------------------------------------

teks1		db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |      Anda memesan kamera low entry             | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah 70.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' 1. Pelanggan mengambil barang di tempat'
db 13,10,' 2. Pelanggan melakukan pembayaran pada awal pemesanan '
db 13,10,' 3. Jika terjadi kerusakan maka akan diberikan sanksi sesuai ketentuan'
db 13,10,' 4. Keterlambatan dalam pengembalian akan diberikan sanksi sesuai ketentuan'
db 13,10,' 5. Jika akan melakukan penambahan waktu sewa silahkan order kembali $'
                  

teks2		db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |      Anda memesan kamera Medium                | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah Rp. 90.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' 1. Pelanggan mengambil barang di tempat'
db 13,10,' 2. Pelanggan melakukan pembayaran pada awal pemesanan '
db 13,10,' 3. Jika terjadi kerusakan maka akan diberikan sanksi sesuai ketentuan'
db 13,10,' 4. Keterlambatan dalam pengembalian akan diberikan sanksi sesuai ketentuan'
db 13,10,' 5. Jika akan melakukan penambahan waktu sewa silahkan order kembali $'
               
teks3 	db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |      Anda memesan kamera Profesional           | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah Rp. 110.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' 1. Pelanggan mengambil barang di tempat'
db 13,10,' 2. Pelanggan melakukan pembayaran pada awal pemesanan '
db 13,10,' 3. Jika terjadi kerusakan maka akan diberikan sanksi sesuai ketentuan'
db 13,10,' 4. Keterlambatan dalam pengembalian akan diberikan sanksi sesuai ketentuan'
db 13,10,' 5. Jika akan melakukan penambahan waktu sewa silahkan order kembali $'
                   
end start
	




