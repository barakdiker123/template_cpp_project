#include <iostream>

#include "my_asio_tutorial1.h"
#include "timer_asio.h"

int main() {
  std::cout << "Hello, World!" << std::endl;
  // tutorial1();

  // usage of timer_asio.h
  boost::asio::io_context io;
  printer p(io);
  io.run();

  return 0;
}
