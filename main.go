package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

func hello(w http.ResponseWriter, r *http.Request) {
	name := r.FormValue("name")
	if name == "" {
		name = "world"
	}
	resp := fmt.Sprintf("Hello %s!\n", name)
	w.Write([]byte(resp))
}

func main() {
	// enable dynamic port
	port := flag.Int("p", 80, "server port")
	flag.Parse()

	http.HandleFunc("/", hello)
	addr := fmt.Sprintf(":%d", *port)
	log.Println("Start listening to", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
