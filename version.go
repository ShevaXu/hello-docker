package main

import (
	"fmt"
	"runtime"
)

var (
	// BuildSign allows builder to sign.
	BuildSign = ""

	// BuildDate marks the date of building the application.
	BuildDate = ""

	// BuildHash marks the latest git version of the build.
	BuildHash = ""

	buildInfo = ""
)

const infoTemplet = `Git-SHA: %s
Built-at: %s
Run-by: %s/%s - %s
Signed-by: %s
`

func init() {
	buildInfo = fmt.Sprintf(infoTemplet, BuildHash, BuildDate,
		runtime.GOOS, runtime.GOARCH, runtime.Version(),
		BuildSign)
}
