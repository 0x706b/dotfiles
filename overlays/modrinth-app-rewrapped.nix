final: prev: {
  modrinth-app-rewrapped = prev.__stable.modrinth-app.overrideAttrs (oa: {
    buildCommand = ''
      gappsWrapperArgs+=(
        --set WEBKIT_DISABLE_DMABUF_RENDERER 1
      )
    '' + oa.buildCommand;
  });
}
