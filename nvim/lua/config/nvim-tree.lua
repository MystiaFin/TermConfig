return {
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  sort = {
      sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    root_folder_modifier= ":t",
    icons = {
      webdev_colors = true,
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
      }
    }
  },
  filters = {
    dotfiles = true,
  },
}
