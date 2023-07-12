import 'package:flutter/material.dart';

class BeritaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berita Terkini',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/news.jpg'),
                        ),
                      ),
                      title: Text('Susul Sawit, Harga Karet Naik'),
                      subtitle: Text('Berita 1'),
                      onTap: () {
                        _navigateToDetail(
                          context,
                          'Susul Sawit, Harga Karet Naik',
                          'Harga karet naik ke level Rp 18.400 per kg, menyusul harga tandan buah segar (TBS) kelapa sawit yang sebelumnya naik signifikan ke angka Rp 2.865 per kg. Meskipun begitu, harga karet di tingkat berbeda-beda. Seperti di Kampar, harga karet di tingkat petani hanya Rp 9.950 per kg dan masih tetap stabil. Lalu untuk Rokan Hulu harga naik Rp 525 dari semula Rp 7.750 jadi Rp 8.275 per kg. Harga stabil juga terjadi di Rokan Hilir Rp 8.800 per kg. Sedangkan di Kuantan Singingi harga karet tingkat petani lebih tinggi dari Rokan Hilir, yakni Rp 9.800. Selisih harga juga terjadi di Indragiri Hulu yang hanya Rp 8.000 per kg. "Harga bokar tertinggi ada di Bengkalis. Di daerah ini harga karet petani Rp 9.649 per kg dan naik Rp 140 menjadi Rp 9.789, nyaris sampai Rp 10.000.',
                          'assets/images/news.jpg',
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/sadap.jpg'),
                        ),
                      ),
                      title: Text('Ini Penyebab Realisasi Ekspor Karet Dari Sumut Anjlok'),
                      subtitle: Text('Berita 2'),
                      onTap: () {
                        _navigateToDetail(context,
                         'Ini Penyebab Realisasi Ekspor Karet Dari Sumut Anjlok', 
                         'Realisasi ekspor karet di Sumut mengalami penurunan pada November 2022. Tercatat, ada penurunan 17,5 persen menjadi 20.237 ton secara bulanan. Sebelumnya pada Oktober 2022, tercatat 24.537 ton.Sekretaris Eksekutif Gabungan Perusahaan Karet Indonesia (Gapkindo) Sumut, Edy Irwansyah mengungkapkan realisasi eksport karet pada November ini kian jauh dari standar rata-rata pengiriman."Realisasi ekspor karet dari Sumatera Utara untuk pengapalan November 2022 menurun 17,5 persen menjadi 20.237 ton MoM dibandingkan Oktober 2022. Realisasi ini semakin masih jauh dari rata-rata ekspor bulanan sekitar 38-40 ribu ton," ungkap Edy, Rabu (14/12/2022).', 
                         'assets/images/sadap.jpg',);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pub.jpg'),
                        ),
                      ),
                      title: Text('Wabup Kunjungi Pabrik Karet'),
                      subtitle: Text('Berita 3'),
                      onTap: () {
                        _navigateToDetail(context, 
                        'Wabup Kunjungi Pabrik Karet',
                         'Hasil pengolahan karet tingkat petani, di beberapa daerahKutai Barat (Kubar) menunjukkan kualitas yang semakin bagus. Terbuktisecara teknis, tidak ditemukannya pori-pori yang banyak dari karetitu. “Hal ini menandakan kualitas karetnya bagus,”kata Wabup Kubar Edyanto Arkan, saat meninjau pengolahan karet, di PT Davco Sendawar Industri (DSI), Kampung Rejo Basuki Kecamatan Barong Tongkok, Kamis (25/7).Wabup menambahkan hasil ini sangat menggembirakan, semuanya berkat kerjasama Dinas Pertanian Kubar melalui Balai Penyuluh Pertanian (BPP) memberikan penyuluhan kepada petani, bagaimana menghasilkan karet yang bersih dengan menggunakan cuka karet atau specta (penggumpal getah karet), sehingga meningkatkan hasil karet sekarang yang cukup bagus', 
                         'assets/images/pub.jpg');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/fot.jpg'),
                        ),
                      ),
                      title: Text('Kemenperin Bertekad Tumbuhkan Industri Pengolahan Karet Remah'),
                      subtitle: Text('Berita 4'),
                      onTap: () {
                        _navigateToDetail(context,
                        'Kemenperin Bertekad Tumbuhkan Industri Pengolahan Karet Remah', 
                        'Kementerian Perindustrian terus mendorong pertumbuhan sektor industri pengolahan crumb rubber (karet remah). Oleh karena itu, melalui Paket Kebijakan Ekonomi XVI yang telah dikeluarkan pemerintah, dengan salah satu poinnya adalah merelaksasi Daftar Negatif Investasi (DNI) untuk industri crumb rubber diharapkan dapat menumbuhkembangkan sektor tersebut di dalam negeri.“Selama periode tahun 2012-2016, hanya ada penambahan satu perusahaan saja di industri pengolahan crumb rubber. Maka itu, kami review khusus untuk UMKM, ada yang kita buka dan ada yang melibatkan asing terbatas,” kata Menteri Perindutrian Airlangga Hartarto ketika mengunjungi pabrik karet PT New Kalbar Processors (NKP) di KabupatenKubu Raya, Kalimantan Barat, Sabtu (17/11).',
                         'assets/images/fot.jpg');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/sembako.jpg'),
                        ),
                      ),
                      title: Text('Pabrik Karet Tetap Salurkan Sembako ke Masyarakat'),
                      subtitle: Text('Berita 5'),
                      onTap: () {
                        _navigateToDetail(context, 
                        'Pabrik Karet Tetap Salurkan Sembako ke Masyarakat', 
                        'Sejumlah pabrik karet di Kalimantan Barat saat ini mengurangi jam operasionalnya. Hal ini karena minimnya karet yang disuplai dari perkebunan. Ketua Gabungan Perusahaan Perkebunan Karet Indonesia, Jusdar menyebut suplai berkurang sejak dua bulan terakhir. Menurutnya hal ini lantaran kegiatan menoreh menurun karena ada isu penutupan pabrik karet akibat Covid-19.“Para petani mengeluhkan harga yang rendah, sehingga mereka enggan menoreh. Ditambah lagi hoaks yang beredar menyebutkan pabrik-pabrik tidak mau membeli karet petani, karena operasional tutup selama krisis Covid-19. Padahal tidak begitu. Malahan, saat ini pabrik sangat kekurangan bahan baku,” ujarnya saat menyerahkan bantuan sembako kepada warga Siantan, Senin (18/5).',
                        'assets/images/sembako.jpg');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/ari.jpg'),
                        ),
                      ),
                      title: Text('Kemenperin Dorong Daya Saing Industri Pengolahan Karet'),
                      subtitle: Text('Berita 6'),
                      onTap: () {
                        _navigateToDetail(context, 
                        'Kemenperin Dorong Daya Saing Industri Pengolahan Karet',
                         'Kementerian Perindustrian (Kemenperin) berkomitmen mendorong sektor industri pengolahan karet agar semakin produktif dan memiliki daya saing, sekaligus mampu melakukan diversifikasi produk dengan terus memacu program hilirisasi produk karet. Hal itu didukung potensi Indonesia yang menjadi produsen karet alam terbesar kedua di dunia.“Kontribusi sektor industri pengolahan karet nasional terhadap perolehan devisa mencapai 3,422 miliar dolar AS pada 2019. Saat ini, terdapat 163 industri karet alam dengan serapan tenaga kerja langsung sebanyak 60 ribu orang,” kata Kepala Badan Penelitian dan Pengembangan Industri (BPPI) Kemenperin Doddy Rahadi di Jakarta, Rabu (9/12).',
                          'assets/images/ari.jpg');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Hero(
                        tag: 'news-image',
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/tim.jpg'),
                        ),
                      ),
                      title: Text('Timbulkan Bau Busuk dan Mengganggu Warga, Pabrik Karet di Mojokerto Ditutup'),
                      subtitle: Text('Berita 7'),
                      onTap: () {
                        _navigateToDetail(context,
                         'Timbulkan Bau Busuk dan Mengganggu Warga, Pabrik Karet di Mojokerto Ditutup', 
                         'Mojokerto (Greeners) Pemerintah Kabupaten Mojokerto resmi menutup pabrik pengolahan karet PT Bumi Nusa Makmur (BNM), di Desa Medali, Kecamatan Puri, Kabupaten Mojokerto, Jawa Timur. Penutupan tersebut karena limbah berbau busuk dari pabrik sudah mengganggu warga belasan desa sekitar.Penutupan pabrik karet tersebut berdasarkan Surat Keputusan (SK) Bupati Mojokerto, Mustofa Kamal Pasa, Nomor 188.45/792/HK/416-012/2016 tentang Pencabutan SK Bupati Nomor 188.45/1380/HK/416-012/2008 tentang Izin Gangguan Pendirian Perusahaan Industri Karet dan Plastik serta Barang-barang dari Karet dan Plastik PT BNM tertanggal 8 Desember 2016. Poin utama keputusan tersebut adalah mencabut izin gangguan (HO).', 
                         'assets/images/tim.jpg');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String title, String description, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBeritaScreen(title: title, description: description, gambar: image),
      ),
    );
  }
}

class DetailBeritaScreen extends StatelessWidget {
  final String title;
  final String description;
  final String gambar;

  const DetailBeritaScreen({required this.title, required this.description, required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'news-image',
            child: Image.asset(
              gambar,
              fit: BoxFit.cover,
              height: 200.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

