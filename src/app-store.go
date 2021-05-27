package main

import (
	"fmt"
	"os"
	"os/exec"
	"time"
)

func isInstalled(app string) bool {
	path := fmt.Sprintf("/Applications/%s.app", app)
	_, err := os.Stat(path)
	if err == nil {
		return true
	}
	return false
}

func main() {
	// list of applications to install
	// keys represent the folder name in the `/Applications` directory
	// values are the App Store urls (replace the `https` scheme for `itms-apps`)
	applications := map[string]string{
		"1Password 7":    "itms-apps://apps.apple.com/us/app/1password-password-manager/id568903335",
		"Boop":           "itms-apps://apps.apple.com/br/app/boop/id1518425043",
		"Developer":      "itms-apps://apps.apple.com/br/app/apple-developer/id640199958",
		"Gifox":          "itms-apps://apps.apple.com/br/app/gifox-2/id1461845568",
		"Kindle":         "itms-apps://apps.apple.com/br/app/kindle/id405399194",
		"Keynote":        "itms-apps://apps.apple.com/br/app/keynote/id409183694",
		"Numbers":        "itms-apps://apps.apple.com/br/app/numbers/id409203825",
		"Pages":          "itms-apps://apps.apple.com/br/app/pages/id409201541",
		"Skitch":         "itms-apps://apps.apple.com/br/app/skitch-snap-mark-up-share/id425955336",
		"Snappy":         "itms-apps://apps.apple.com/us/app/snappy-snapshots-the-smart-way/id512617038",
		"Slack":          "itms-apps://apps.apple.com/us/app/slack/id618783545",
		"Speedtest":      "itms-apps://apps.apple.com/br/app/speedtest-by-ookla/id1153157709",
		"The Unarchiver": "itms-apps://apps.apple.com/us/app/the-unarchiver/id425424353",
		"Xcode":          "itms-apps://apps.apple.com/us/app/xcode/id497799835",
		"Playgrounds":    "itms-apps://apps.apple.com/br/app/swift-playgrounds/id1496833156",
	}

	for app, url := range applications {
		if isInstalled(app) {
			fmt.Printf("%s is already installed\n", app)
		} else {
			fmt.Printf("Installing %s...\n", app)

			// open application url on app store
			exec.Command("open", url).Start()

			// wait until the application is installed
			for {
				time.Sleep(1 * time.Second)

				// break this wait loop, going to the next application in the map
				if isInstalled(app) {
					break
				}
			}
		}
	}

	fmt.Println("Everything is installed!")
}
