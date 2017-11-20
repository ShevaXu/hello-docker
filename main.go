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
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "Hello %s!\n", name)
}

func version(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(buildInfo))
}

func main() {
	// enable dynamic port
	port := flag.Int("p", 8080, "server port")
	flag.Parse()

	http.HandleFunc("/hello", hello)
	http.HandleFunc("/version", version)

	addr := fmt.Sprintf(":%d", *port)
	log.Println("Start listening to", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
