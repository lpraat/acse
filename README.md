#  Advanced Compiler Suite for Education (ACSE) - v1.1.4
In this repo you can find some extensions to the ACSE compiler implemented for learning purposes. The parsing and the semantic implementation of each new construct is provided in a separated branch.

## Example - Support for python-like for range
```javascript
for i in range(100) {
    write(i);
}

write(i);  // This should print 99
```

Switch to target branch:
```bash
git checkout for_range
```

Compile test program and run it on MACE (Machine for Advance Compiler Education):
```bash
make &&  # Compile acse
bin/acse tests/for_range/for_range.src &&  # Compile test program
bin/asm output.asm &&  # Generate object code for MACE
bin/mace output.o  # Run code on MACE
```


# Useful resources
- [Bison Manual](https://www.gnu.org/software/bison/manual/bison.html)