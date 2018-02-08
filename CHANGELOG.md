# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
- `check-temperature.rb`: removed unnecessary `print`

## [1.1.0] - 2017-05-17
- add temperature check (@holygits)

## [1.0.0] - 2017-03-15
### Added
- made metrics aware of multiple chips (@GhostLyrics)
- made metrics also collect power draw (@GhostLyrics)
- support for Ruby 2.3.0 (@eheydrick)

### Removed
- support for Ruby < 2 (@eheydrick)

### Changed
- Rubocop upgrade and cleanup (@mattyjones/@eheydrick)
- Loosen `sensu-plugin` dependency to `~> 1.2` (@mattyjones)

## [0.0.3] - 2015-07-14
### Changed
- update sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-02
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.1.0...HEAD
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.3...1.0.0
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-environmental-checks/compare/0.0.1...0.0.2
