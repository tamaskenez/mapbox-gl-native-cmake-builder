#include "zlib.h"
#include "png.h"
#include "curl/curl.h"
#include "GL/glew.h"
#include "glfw/glfw3.h"
#include "uv.h"

#include <cstdio>

int main(int, char*[])
{
	int a = glewInit();
	printf("glewInit: %d\n", a);
    return 0;
}