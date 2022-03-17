References:

## setup phoenix and elixir

https://medium.com/swlh/tutorial-693a566ea417
https://code.likeagirl.io/how-to-install-elixir-and-phoenix-on-mac-dc21f8ce5a15

## Postgres

http://www.mikeball.us/blog/setting-up-postgres-with-homebrew/

## Ecto and migrations

https://elixirschool.com/en/lessons/ecto/associations
https://hexdocs.pm/ecto/2.2.10/Mix.Tasks.Ecto.Rollback.html
https://serokell.io/blog/ecto-guide-for-beginners

## Liveview

https://github.com/phoenixframework/phoenix_live_view
https://elixir-lang.org/getting-started/typespecs-and-behaviours.html
https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html
https://hexdocs.pm/phoenix_live_view/form-bindings.html
https://blog.appsignal.com/2022/01/11/build-interactive-phoenix-liveview-uis-with-components.html

## React Server components

https://blog.bitsrc.io/react-server-components-1ca621ac2519
https://vercel.com/blog/everything-about-react-server-components
https://blog.plasmic.app/posts/how-react-server-components-work/
https://nextjs.org/docs/advanced-features/react-18/server-components

Generated page data using:

mix phx.gen.html Blog BlogPage blogpages pageId:string type:string sectionId:string sectionName:string webPublicationDate:datetime webTitle:string webUrl:string apiUrl:string pillarId:string pillarName:string

live blog block data structure

date
content id
time
title
content with html
pinned
key event
updated time

mix phx.gen.live Blog LiveBlogBlock liveblogblocks date:datetime content_id:references:blogpages title:string content:string pinned:boolean key_event:boolean updated_time:datetime

Todo:

- build new pheonix project for liveblog demo ✅
- add live blog page (as normal content type) ✅
- - Style live blog page
- add live blog blocks (as live content)
- - Link content id to blog id
- - - add foreign key constraint ✅
- - - populate ui list from db - wip
- - Style live blog content
- build rendering page for public
- write/steal css / markup ✅
