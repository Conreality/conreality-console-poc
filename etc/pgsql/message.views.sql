DROP VIEW IF EXISTS public.message_with_avatar RESTRICT;

CREATE VIEW public.message_with_avatar AS
  SELECT m.*, p.avatar FROM public.message m INNER JOIN public.player p ON m.sender = p.uuid;
