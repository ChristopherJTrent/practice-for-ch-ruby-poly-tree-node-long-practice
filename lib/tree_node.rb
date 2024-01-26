class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end
  def parent=(new_parent)
    @parent.children.reject! {|ele| ele == self} if @parent
    @parent = new_parent 
    new_parent.children << self if new_parent && !new_parent.children.include?(self) 
  end
end