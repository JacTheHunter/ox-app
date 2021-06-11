
class SortBrands_Filters {
  final String title;
  final int id;

  SortBrands_Filters({this.title, this.id});
}

List<SortBrands_Filters> brands_filter = [
  SortBrands_Filters(
    title: 'Популярные',
    id: 0,
  ),
  SortBrands_Filters(
    title: 'A - Z',
    id: 1,
  ),
  SortBrands_Filters(
    title: 'Z - A',
    id: 2,
  ),
];
