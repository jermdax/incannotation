#ifndef MESSAGING_H
#define MESSAGING_H

#include <stdint.h>

#define S_VAR

static void serverSetup(char* server_ip, uint16_t port);
static void clientSetup(char* server_ip, int server_port);
void setupchar* server_ip, int server_port);

void sendMessage(uint16_t msg_id, uint16_t msg_len, uint8_t* data);
void recvMessage(uint16_t msg_id, uint16_t msg_len, uint8_t* data);

#endif //messaging_h
