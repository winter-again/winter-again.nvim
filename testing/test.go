package main

import "fmt"

type Bar struct {
	name string // the name
	age  int    // the id
}

// main func docs
func main() {
	fmt.Println("Hi, mom.")
	for i := range 5 {
		fmt.Println(i)
		fmt.Println(foo(i, 7))
	}
}

// documentation
func foo(a int, b int) int {
	return a + b
}
