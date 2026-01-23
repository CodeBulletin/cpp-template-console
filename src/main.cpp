#include <version.h>
#include <iostream>

@PKGINCLUDE@

int main() {
    std::cout << "Project Name: " << PROJECT_NAME << std::endl;
    std::cout << "Version: " << PROJECT_VERSION << std::endl;
    std::cout << "Author: " << PROJECT_AUTHOR << std::endl;

    @CODEEXAMPLE@
}
