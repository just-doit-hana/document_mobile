enum FolderViewType {
  list,
  grid;

  bool get isList => this == FolderViewType.list;
  bool get isGrid => this == FolderViewType.grid;
}
