pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
    bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  constructor() public {
    createTask("Welcome To The Tweethereum");
  }

  function createTask(string memory _content) public payable {
  //require(msg.value >= 0.1 ether, "Not enough ETH provided");
  taskCount ++;
  tasks[taskCount] = Task(taskCount, _content, false);
  emit TaskCreated(taskCount, _content, false);
}

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }


}
