# exp-001

`main.ll` is hand-written LLVM IR to implement a `check` function
that takes two arguments, `a` and `b`, and returns `0` if
`(%a == 1 && %b == 2)`, `1` otherwise.

## Usage

```
$ llc-3.8 main.ll -o main.s
$ cat main.s 
$ gcc main.s -o main
$ ./main 
```

### Output

```
0
1
```
