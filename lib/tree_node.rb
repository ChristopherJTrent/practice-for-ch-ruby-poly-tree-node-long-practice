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
  def add_child(new_child)
    # should call new_child.parent = <something>
    # should make sure that it's not adding a duplicate child
    new_child.parent = self
    self.children << new_child unless self.children.include?(new_child)
  end
  def remove_child(child)
    raise "cannot remove unrelated node" unless children.include?(child)
    child.parent = nil
  end
  def dfs(value)
    return self if self.value == value
    children.each do |child|
      found = child.dfs(value)
      return found if found
    end
    nil
  end
  def bfs(value)
    queue = [self]
    until queue.empty?
      element = queue.shift
      return element if element.value == value
      queue.push(*element.children)
    end
    nil
  end
end