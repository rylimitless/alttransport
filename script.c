#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 3
#define MAX_COMMIT_MSG_LENGTH 500

void build(){
    int status = system("git status");
    if (!status){
        puts("Failed to make build call");
        exit(-1);
    }
}

void commit(char * commitMessage){

    char msg [MAX_COMMIT_MSG_LENGTH];
    sprintf(msg,"git commit -m %s",commitMessage);
    system("git add *");
    system(msg);

}

int main(int argc , char * argv[]){

    if(argc>MAX_LENGTH){
        printf("Invalid command specified\n");
        exit(-1);
    }

    char * command = argv[1];
    char * message = argv[2];

    puts(message);

    if(strcmp(command,"commit")==0){
        commit(message);
    }


}