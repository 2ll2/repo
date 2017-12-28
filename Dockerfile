FROM busybox:musl

ARG overlay
ARG version

COPY [ \
  "./$overlay/$version", \
  "/home/builder/repo/$overlay/$version" \
]

# NOTE: DO NOT ADD ANY MORE LAYERS
#
# Adding additional can increase images size unnecessarily. So, don't do it!
