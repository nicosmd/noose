target_sources(${TARGET_NAME} PRIVATE
        yaml_variant.c
        parse.c
        add_to_arrays.c
        impl
        impl/node_params.h
        impl/yaml_variant.h
        impl/types.h
        impl/add_to_arrays.h
        impl/namespace.h
        impl/parse.h
        namespace.c
        node_params.c
        parser.c
)
