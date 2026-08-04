package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>🚀 ¡Hola Mundo desde un Servidor de Produccion Seguro!</h1>")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Servidor iniciado en http://localhost:8080...")
	http.ListenAndServe(":8080", nil)
}
