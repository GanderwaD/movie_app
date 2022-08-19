enum RefreshStyle {
  // indicator box always follow content
  Follow,
  // indicator box follow content,When the box reaches the top and is fully visible, it does not follow content.
  UnFollow,

  /// Let the indicator size zoom in with the boundary distance,look like showing behind the content
  Behind,

  /// this style just like flutter RefreshIndicator,showing above the content
  Front
}