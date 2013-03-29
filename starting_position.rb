class StartingPosition
  def get(map)
    city_tiles = map.tiles.select { |tile| tile.type == :city }
    selected_city = city_tiles.sort { |tile1, tile2| tile1.x <=> tile2.x }[city_tiles.length / 2]

    starting_tile = map.tiles.select { |tile| (tile.x == selected_city.x + 1 || tile.x == selected_city.x - 1) &&
                                              (tile.y == selected_city.y + 1 ||tile.y == selected_city.y - 1) &&
                                              tile.passable? }.shuffle.first

    {x: starting_tile.x, y: starting_tile.y}
  end

  def get_city_starting_position(map)
    entrance = map.tiles.select { |tile| tile.type == :entrance }[0]

    starting_tile = map.tiles.select { |tile| (tile.x == entrance.x + 1 || tile.x == entrance.x - 1) &&
                                              (tile.y == entrance.y + 1 ||tile.y == entrance.y - 1) &&
                                              tile.passable? }.shuffle.first

    {x: starting_tile.x, y: starting_tile.y}
  end
end