class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent= (parent)
    @parent.delete_child(self) unless @parent.nil?
    @parent = parent
    parent.commit_child(self) unless parent.nil?
  end

  def add_child(child)
    child.parent = self
  end

  def commit_child(child)
    @children.push(child) unless @children.include?(child)
  end


  def remove_child(child)
    raise "Not a child" unless @children.include?(child)
    child.parent = nil
  end

  def delete_child(child)
    @children.delete(child)
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    return self if @value == target_value
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue.concat(node.children)
    end
    nil
  end

end
