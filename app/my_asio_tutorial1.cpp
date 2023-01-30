
#include <boost/asio.hpp>
#include <iostream>
auto tutorial1() -> int {
  boost::asio::io_context io;
  boost::asio::steady_timer t(io, boost::asio::chrono::seconds(5));
  std::cout << "Hello Barak!" << std::endl;
  t.wait();
  std::cout << "Hello, world!" << std::endl;
  return 0;
}
void print(const boost::system::error_code & /*e*/) {
  std::cout << "Hello, world!" << std::endl;
}

auto tutorial2() -> int {
  boost::asio::io_context io;
  boost::asio::steady_timer t(io, boost::asio::chrono::seconds(5));
  t.async_wait(&print);
  std::cout << "Hello Barak" << std::endl;
  sleep(10);
  io.run();
  std::cout << "finished!!!" << std::endl;
  return 0;
}
