StatusFilterChips:

- Trigger: Readability.
- What it owns: Tata letak horizontal (Row, SingleChildScrollView), padding, spacing, dan logika visual chip terpilih (selected).
- What it reports upward: Event perubahan filter via onSelected(GameStatus?).
  GameList:
- Trigger: Readability.
- What it owns: Tampilan empty state, konfigurasi ListView.builder, pemetaan objek Game, dan pengikatan callback per item.
- What it reports upward: Aksi ubah status via onStatusChanged(id, status) dan aksi hapus via onDelete(id).
  GameListItem:
- Trigger: Reuse.
- What it owns: Tampilan visual satu kartu game (Card, ListTile, CircleAvatar, PopupMenuButton), pemetaan warna status, dan daftar opsi popup menu.
- What it reports upward: Event perubahan status via onStatusChanged(status) dan event hapus via onDelete().
  AddGameButton:
- Trigger: Readability.
- What it owns: Konfigurasi tipe tombol (FloatingActionButton), ikon tambah, dan posisi tombol pada layout Scaffold.
- What it reports upward: Event klik tombol via onPressed().
