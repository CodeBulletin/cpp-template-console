#include <version.h>
#include <iostream>

@PKGINCLUDE@

int main(int argc, char** argv) {
    std::cout << "Project Name: " << PROJECT_NAME << std::endl;
    std::cout << "Version: " << PROJECT_VERSION << std::endl;
    std::cout << "Author: " << PROJECT_AUTHOR << std::endl;

@CODEEXAMPLE@

    return 0;
}
