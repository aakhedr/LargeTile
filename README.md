
# Demo

### Showing how `UISearchContorller` wrecks on iPhone if embedded in detail view controller of a `UISplitViewController` while on iPad everything works fine.

Demo uses the Master-Deatail App template with slight modifications:
* Strings of Apple products instead of instances of `NSDate`.
* An extra `UIViewController`.
* `UISearchResultsUpdating` not implemented in either `MasterViewController` or `DetailViewController`.

When running on iPhone:
* `UISearchBar` does not show initially.
* After segue to `FinalViewController` and tapping back again to `DetailViewController`, the search bar appears.
* If `UISearchBar` is tapped it does not fit correctly in the navigation bar.

When running on iPad:
* Everything works as expected.

# Build requirements

* iOS 11.0 SDK or later

# Runtime requirements

* iOS 10.0 or later
