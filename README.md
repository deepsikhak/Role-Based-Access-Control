# README

Basic Role Based Authentication system.

Schema:
* Users Table contains Multiple user(ex - Jack, Jon, Alice, Bob)
* Roles Table contains Multiple Role (ex - analyst, developer, tester, manager, admin, agent, hr)
* Actions Table will contains 3 actions (Read, Write, Delete)
* Resources Table will contain multiple resources (Dashboard, BikeDetails, Catalog, BikePricing, Location, Timings) 
* UserRole Table will contain entries for role_id and user_id (A user can have many row for different role_id)
* Permissions Table will contain roles_id, action_id, resource_id ([id=5, developer, BikePricing, Write] - Which means a developer role can change bike pricing)

Examples to make you Understand Better:
Let say user Jack has two UserRole(Developer and manager i.e two entries in the userRole table)
And let say our permission table look like Assumption delete will have (Read and write access) and Write will have (Read access):

* Developer, Dashboard, read
* Developer, BikeDetails, write
* Developer, Location, read
* Manager, BikeDetails, Delete
* Manager, Location, Write
* Manager, Timings, Write

So Since he have manager and developer access he will have permission merge from both of them.
He Can READ dashboard as he is developer he ca delete BikeDetails as he is Manager also
