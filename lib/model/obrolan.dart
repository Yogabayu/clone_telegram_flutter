class RecentObrolan {
  final String id;
  final String title;
  final String images;

  RecentObrolan({required this.id, required this.title, required this.images});
}

List<RecentObrolan> dummyObrolan = [
  RecentObrolan(
    id: "1",
    title: "Pinos",
    images: 'https://picsum.photos/seed/girl/200/300',
  ),
  RecentObrolan(
    id: "2",
    title: "Joni",
    images: 'https://picsum.photos/seed/kid/200/300',
  ),
  RecentObrolan(
    id: "3",
    title: "Bendot",
    images: 'https://picsum.photos/seed/man/200/300',
  ),
  RecentObrolan(
    id: "4",
    title: "Mbhe",
    images: 'https://picsum.photos/seed/boy/200/300',
  ),
  RecentObrolan(
    id: "5",
    title: "Pak ijal",
    images: 'https://picsum.photos/seed/mountain/200/300',
  ),
  RecentObrolan(
    id: "6",
    title: "Pak Dani",
    images: 'https://picsum.photos/seed/nice/200/300',
  ),
];
