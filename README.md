# yaml-flattener

I wrote a simple converter for YAML files in Ruby. This flattens the YAML structure and outputs to a new file.

To use:

`ruby yaml-flattener <example.yml>`

Output file will be `example_flat.yml`

Example:


```yaml
# input
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
# output
countries.netherlands.cities:
  - Rotterdam
  - Amsterdam
countries.germany.cities:
  - Berlin
  - Hamburg

```

TODO: Reverse the process.
