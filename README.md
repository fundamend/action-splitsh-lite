# action-splitsh-lite

_action-splitsh-lite_ is a workflow for [GitHub Actions] used by the [fundamend.dev] ecosystem.
It splits and synchronizes sub-directories of a monorepo into their own public repositories using [splitsh-lite].

## Usage

In your repository, create a workflow that uses _action-splitsh-lite_ after a checkout, like so:

```yaml
name: Synchronize Sub-Repository

on: [push]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Synchronize sub-repo
        uses: fundamend/action-splitsh-lite@main
        with:
          source-directory: 'src/sub-repo/'
          target-ropisotry: 'owner/sub-repo'
          target-deploy-key: ${{ secrets.GITHUB_SSH_KEY }}
```

The action takes the following inputs:

| Key                   | Description                                                                |
| --------------------- | -------------------------------------------------------------------------- |
| `source-directory`\*  | The source directory in the monorepo that should be split and synchronized |
| `target-repository`\* | The target repository (including owner)                                    |
| `target-branch`       | The target branch name (default `main`)                                    |
| `target-deploy-key`\* | The private key part of a Deploy Key on the target repository              |

The \* indicates mandatory input.

## License

[MIT]

[fundamend.dev]: https://fundamend.dev
[github actions]: https://docs.github.com/en/actions
[github]: https://github.com/
[mit]: https://choosealicense.com/licenses/mit/
[splitsh-lite]: https://github.com/splitsh/lite
