package runner

import (
	"time"
)

const DefaultStartTimeout = 45 * time.Second

// DefaultNamer is the default naming function
var DefaultNamer NameFunc = helpers.UniqueName

// A NameFunc is used to generate container names.
type NameFunc func() string
