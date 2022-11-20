## Employee Specialty Decoder domain

This domain is responsible for decoding a list of input ID's into a list of specialty names

Mental Models:

- A `raw input id` is the raw string input of an id
- An `input id` is the string input of an id that is guaranteed to only contain numbers
- An `id number` is the number associated with a specialty
- A `specialty name` is the human readable name for a specialty
- A `specialty with id` is a mental model that holds information about what `specialty name` an `id number` is associated with

The rules of thumb are:

- A `raw input id` may have non numeric characters in it so they have to be cleaned and removed to get an `input id`
- A list of `raw input id` may have duplicate representation of `id number` so it is important to only keep unique instances that are closest to the start of the list

An expert EmployeeSpecialtyDecoder should always be able to perform these calculations:

- Determine the correct list of `specialty name` when given a valid `specialty with id` list and valid list of `raw input id` to decode

### Intended Library Usage
The `decode` method is the exported method to be used to get a correct list of `specialty name` from a valid `specialty with id` list and valid list of `raw input id`
