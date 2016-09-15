# yaml-flattener

I wrote a simple converter for YAML files in Ruby. This flattens the YAML structure and outputs to a new file.

To use:

`ruby yaml-flattener <example.yml>`

Output file will be `example_flat.yml`

Example:


```yaml
# cities.yml

countries:
  netherlands:
    cities:
      - Rotterdam
      - Amsterdam
  germany:
    cities:
     - Berlin
     - Hamburg
```

```yaml
# cities_flat.yml

countries.netherlands.cities:
  - Rotterdam
  - Amsterdam
countries.germany.cities:
  - Berlin
  - Hamburg

```

TODO: Reverse the process.
