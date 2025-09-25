return {
  settings = {
    yaml = {
      ['format.singleQuote'] = true,
      schemas = {
        ['http://json.schemastore.org/kustomization'] = {
          'kustomization.yaml',
        },
        ['https://raw.githubusercontent.com/cappyzawa/concourse-pipeline-jsonschema/master/concourse_jsonschema.json'] = {
          'pipeline.yml',
          'pipeline.yaml',
        },
        kubernetes = {
          '/*manifests*/**/*.yml',
          '/*manifests*/**/*.yaml',
          'kubectl-edit-*.yaml',
          '!kustomization.yaml',
        },
      },
    },
  },
}
