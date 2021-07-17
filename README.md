# hugo-extended

The hugo-extended container by Warpnet B.V. has hugo built with the `--extended` flag.
During the installation, the `postcss`, `postcss-cli` and `autoprefixer` npm packages are also installed.

## Example usage

```bash
podman -v ./:/data:Z -p 1313:1313 warpnetbv/hugo-extended:latest
```
