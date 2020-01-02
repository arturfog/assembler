#define NOP __asm("nop");
int main(int argc, char* argv[]) {
    NOP
    int i1 = 123;
    unsigned int i2 = 234;
    NOP
    char c1 = 'A';
    NOP
    float f1 = 0.5;
    NOP
    double d1 = 3.145;
    NOP
    bool b1 = true;
    NOP
    return 0;
}

void loopTest() {
    int j = 0;
    for(int i = 0; i < 100; i++) {
        j += i;
    }
}

void structTest() {
    struct S1
    {
        int i1;
        char c1;
    };
    S1 s1;
    s1.i1 = 2;
    s1.c1 = 'B';
}

void arrayTest() {
    NOP
    int a1[100];
    a1[0] = 10;
    NOP
}

void pointerTest() {
    int i1 = 123;
    NOP
    int* p1 = &i1;
    NOP
    *p1 = 234;
}

void classTest() {
    class TC
    {
    private:
        /* data */
        int data;
    public:
        TC(/* args */) { }
        ~TC() {}
        void setData(int x) {
            data = x;
        }
    };
    NOP
    TC tc;
    NOP
    tc.setData(123);
    NOP
}