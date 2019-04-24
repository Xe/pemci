// +build ignore

package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

const urli = `https://api.github.com/repos/CelestialBoon/WingmakersPoetry/contents`

func main() {
	danfu, err := http.Get(urli)
	if err != nil {
		log.Fatalf("can't get %s: %v", urli, err)
	}

	type cmene struct {
		Name string `json:"name"`
	}

	var datni []cmene
	err = json.NewDecoder(danfu.Body).Decode(&datni)
	if err != nil {
		log.Fatal(err)
	}
	defer danfu.Body.Close()

	for _, cme := range datni {
		if cme.Name != "README.md" {
			fmt.Printf(`@bytesToSlice(u8, @embedFile("./poems/%s")),` + "\n", cme.Name)
		}
	}
}
