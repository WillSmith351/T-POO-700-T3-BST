defmodule TPoo700T3BstWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use TPoo700T3BstWeb, :controller` and
  `use TPoo700T3BstWeb, :live_view`.
  """
  use TPoo700T3BstWeb, :html

  embed_templates "layouts/*"
end
