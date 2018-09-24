# Vulkan docs build container

This is a container to build the [Vulkan® documentation repository](https://github.com/KhronosGroup/Vulkan-Docs/). It tries to closely follow the [build instructions](https://github.com/KhronosGroup/Vulkan-Docs/blob/master/BUILD.adoc) and builds a container based on those for simple reuse.

## Build

Build using `docker build -t vkdocs-builder .`.

## Usage

This container expects two volumes to be mounted:

* `/source` pointing at the checkout of the Vulkan documentation repository
* `/output` pointing at the output directory. This is set using `OUTDIR=/output` inside the container

An example call could look like this:

```
$> docker run --rm -v /path/to/checkout:/source -v /path/to/output:/output vkdocs-builder target
```

`target` can be any of the `Makefile` targets, use `html` to get the default HTML specification built.