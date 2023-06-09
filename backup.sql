PGDMP     -    3                {        
   projecteDB    15.2    15.2 +    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    16417 
   projecteDB    DATABASE        CREATE DATABASE "projecteDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "projecteDB";
                postgres    false            �            1259    16423    equips    TABLE     �   CREATE TABLE public.equips (
    codi character varying NOT NULL,
    numserie character varying,
    marca character varying,
    model character varying,
    estat character varying,
    tipus character varying
);
    DROP TABLE public.equips;
       public         heap    postgres    false            �            1259    24671    espais    TABLE     �   CREATE TABLE public.espais (
    codi character varying NOT NULL,
    planta integer,
    zona character varying,
    posicio integer
);
    DROP TABLE public.espais;
       public         heap    postgres    false            �            1259    24732    espais_equips    TABLE     �   CREATE TABLE public.espais_equips (
    id integer NOT NULL,
    codiespai character varying(50),
    codiequip character varying(50)
);
 !   DROP TABLE public.espais_equips;
       public         heap    postgres    false            �            1259    24731    espais_equips_id_seq    SEQUENCE     �   CREATE SEQUENCE public.espais_equips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.espais_equips_id_seq;
       public          postgres    false    220            3           0    0    espais_equips_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.espais_equips_id_seq OWNED BY public.espais_equips.id;
          public          postgres    false    219            �            1259    24629    reparacions    TABLE     +  CREATE TABLE public.reparacions (
    idreparacio integer NOT NULL,
    idequip character varying,
    datainici character varying,
    datafi character varying,
    comentaris character varying,
    tecnic character varying,
    comentaritancament character varying,
    estat character varying
);
    DROP TABLE public.reparacions;
       public         heap    postgres    false            �            1259    24628    reparacions_idreparacio_seq    SEQUENCE     �   CREATE SEQUENCE public.reparacions_idreparacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.reparacions_idreparacio_seq;
       public          postgres    false    217            4           0    0    reparacions_idreparacio_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.reparacions_idreparacio_seq OWNED BY public.reparacions.idreparacio;
          public          postgres    false    216            �            1259    24756    reserves    TABLE     �   CREATE TABLE public.reserves (
    idreserve character varying NOT NULL,
    idusuari character varying,
    setmana bigint,
    hora bigint,
    temps bigint,
    dia character varying,
    idsala character varying
);
    DROP TABLE public.reserves;
       public         heap    postgres    false            �            1259    32846    reserves_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reserves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 &   DROP SEQUENCE public.reserves_id_seq;
       public          postgres    false    221            5           0    0    reserves_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.reserves_id_seq OWNED BY public.reserves.idreserve;
          public          postgres    false    224            �            1259    24765    solicitud_reparacio    TABLE     �   CREATE TABLE public.solicitud_reparacio (
    idsolicitud character varying NOT NULL,
    idequip character varying NOT NULL,
    comentari character varying NOT NULL
);
 '   DROP TABLE public.solicitud_reparacio;
       public         heap    postgres    false            �            1259    24773    solicitud_reparacio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitud_reparacio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 1   DROP SEQUENCE public.solicitud_reparacio_id_seq;
       public          postgres    false    222            6           0    0    solicitud_reparacio_id_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.solicitud_reparacio_id_seq OWNED BY public.solicitud_reparacio.idsolicitud;
          public          postgres    false    223            �            1259    16437    usuaris    TABLE     �   CREATE TABLE public.usuaris (
    idusuari character varying NOT NULL,
    nom character varying,
    cognoms character varying,
    password character varying,
    email character varying,
    rol character varying,
    telefon character varying
);
    DROP TABLE public.usuaris;
       public         heap    postgres    false            �           2604    24735    espais_equips id    DEFAULT     t   ALTER TABLE ONLY public.espais_equips ALTER COLUMN id SET DEFAULT nextval('public.espais_equips_id_seq'::regclass);
 ?   ALTER TABLE public.espais_equips ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    24725    reparacions idreparacio    DEFAULT     �   ALTER TABLE ONLY public.reparacions ALTER COLUMN idreparacio SET DEFAULT nextval('public.reparacions_idreparacio_seq'::regclass);
 F   ALTER TABLE public.reparacions ALTER COLUMN idreparacio DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    32847    reserves idreserve    DEFAULT     q   ALTER TABLE ONLY public.reserves ALTER COLUMN idreserve SET DEFAULT nextval('public.reserves_id_seq'::regclass);
 A   ALTER TABLE public.reserves ALTER COLUMN idreserve DROP DEFAULT;
       public          postgres    false    224    221            �           2604    24774    solicitud_reparacio idsolicitud    DEFAULT     �   ALTER TABLE ONLY public.solicitud_reparacio ALTER COLUMN idsolicitud SET DEFAULT nextval('public.solicitud_reparacio_id_seq'::regclass);
 N   ALTER TABLE public.solicitud_reparacio ALTER COLUMN idsolicitud DROP DEFAULT;
       public          postgres    false    223    222            "          0    16423    equips 
   TABLE DATA           L   COPY public.equips (codi, numserie, marca, model, estat, tipus) FROM stdin;
    public          postgres    false    214   �1       &          0    24671    espais 
   TABLE DATA           =   COPY public.espais (codi, planta, zona, posicio) FROM stdin;
    public          postgres    false    218   �4       (          0    24732    espais_equips 
   TABLE DATA           A   COPY public.espais_equips (id, codiespai, codiequip) FROM stdin;
    public          postgres    false    220   "5       %          0    24629    reparacions 
   TABLE DATA           }   COPY public.reparacions (idreparacio, idequip, datainici, datafi, comentaris, tecnic, comentaritancament, estat) FROM stdin;
    public          postgres    false    217   �5       )          0    24756    reserves 
   TABLE DATA           Z   COPY public.reserves (idreserve, idusuari, setmana, hora, temps, dia, idsala) FROM stdin;
    public          postgres    false    221   �6       *          0    24765    solicitud_reparacio 
   TABLE DATA           N   COPY public.solicitud_reparacio (idsolicitud, idequip, comentari) FROM stdin;
    public          postgres    false    222   �9       #          0    16437    usuaris 
   TABLE DATA           X   COPY public.usuaris (idusuari, nom, cognoms, password, email, rol, telefon) FROM stdin;
    public          postgres    false    215   �9       7           0    0    espais_equips_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.espais_equips_id_seq', 80, true);
          public          postgres    false    219            8           0    0    reparacions_idreparacio_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.reparacions_idreparacio_seq', 38, true);
          public          postgres    false    216            9           0    0    reserves_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.reserves_id_seq', 136, true);
          public          postgres    false    224            :           0    0    solicitud_reparacio_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.solicitud_reparacio_id_seq', 1, false);
          public          postgres    false    223            �           2606    16429    equips equips_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.equips
    ADD CONSTRAINT equips_pkey PRIMARY KEY (codi);
 <   ALTER TABLE ONLY public.equips DROP CONSTRAINT equips_pkey;
       public            postgres    false    214            �           2606    24737     espais_equips espais_equips_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.espais_equips
    ADD CONSTRAINT espais_equips_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.espais_equips DROP CONSTRAINT espais_equips_pkey;
       public            postgres    false    220            �           2606    24723    espais espais_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.espais
    ADD CONSTRAINT espais_pkey PRIMARY KEY (codi);
 <   ALTER TABLE ONLY public.espais DROP CONSTRAINT espais_pkey;
       public            postgres    false    218            �           2606    24634    reparacions reparacions_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.reparacions
    ADD CONSTRAINT reparacions_pkey PRIMARY KEY (idreparacio);
 F   ALTER TABLE ONLY public.reparacions DROP CONSTRAINT reparacions_pkey;
       public            postgres    false    217            �           2606    24762    reserves reseves_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserves
    ADD CONSTRAINT reseves_pkey PRIMARY KEY (idreserve);
 ?   ALTER TABLE ONLY public.reserves DROP CONSTRAINT reseves_pkey;
       public            postgres    false    221            �           2606    24771 ,   solicitud_reparacio solicitud_reparacio_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.solicitud_reparacio
    ADD CONSTRAINT solicitud_reparacio_pkey PRIMARY KEY (idsolicitud);
 V   ALTER TABLE ONLY public.solicitud_reparacio DROP CONSTRAINT solicitud_reparacio_pkey;
       public            postgres    false    222            �           2606    16450    usuaris usuaris_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuaris
    ADD CONSTRAINT usuaris_pkey PRIMARY KEY (idusuari);
 >   ALTER TABLE ONLY public.usuaris DROP CONSTRAINT usuaris_pkey;
       public            postgres    false    215            �           2606    24743 *   espais_equips espais_equips_codiequip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espais_equips
    ADD CONSTRAINT espais_equips_codiequip_fkey FOREIGN KEY (codiequip) REFERENCES public.equips(codi);
 T   ALTER TABLE ONLY public.espais_equips DROP CONSTRAINT espais_equips_codiequip_fkey;
       public          postgres    false    3205    214    220            �           2606    24738 *   espais_equips espais_equips_codiespai_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espais_equips
    ADD CONSTRAINT espais_equips_codiespai_fkey FOREIGN KEY (codiespai) REFERENCES public.espais(codi);
 T   ALTER TABLE ONLY public.espais_equips DROP CONSTRAINT espais_equips_codiespai_fkey;
       public          postgres    false    218    3211    220            "   �  x����N�0���O�`��I|������,ڛD�d�о=��ڥ�$��o�?�ɸ��-�
�" � ���y�0ɪUV�YgL�xL�x�Ʊbgs��E��(���E�	`Q/�n�`�X8��$�t����ڭ��;���\O{堾Y��UQW���$�"$�>�Uy���U@�#>��sЯ_u��e��M������6�h�YLl��|5�&<�|V��	���oH�(�3�� 5㼪�k��^&�C�5�X�˫�{CF�#��u�V=�T)wR1`LĜ����.�7=C��2+WM��ūW���i��e���h�\q@N@�>o���kkv(#�=�ֲ������A���ESl��E�vm���Wb��Z(ot	B�^-�R �lB�ln;ѽ7�֧�@D�Q����:Z,Bm�i����cɈ�TTOA�����Ar�Y*�J%$�R�>� {���'�KJ�v�zkV�y��ʣ�HE�,�^�!Ȑ8����F #bk�gw����� cb�
���,��X�q{a^K��oZ�����27Ɠԥd�~���u�/k���>�8#��s���\i~>����:� ؉��7Q\"v	�.ߖpc��0:��]폀�_����J�m.�aymFe��Y�V4�<��e���މ!@�Ֆw�rSB� #ֹ�P�d����N����!      &   �   x�M�=�0D�z�0�;��SpA��6���fS~�{co�O)aa����AC�t���~�~�':���~��_��w�=�A����J���_?���&:3�����J�b�F��~ �*�������Mm      (   {   x�]ϱ
B1������$m�ttp�� �� ��oa0�B֏�G�=��Kԏ��M<�c�������V�f5��2˭øX�-��֪MX/&a�y�aZ���f�;8���8|7s�b�[n���`Hz      %      x�m�1n�0�gs
o���&40Fj;EY���klZפ���'�k����D`	!$�����/�&�%+��a1�oK�,I�t�e��e�m��FR4� ���x9�)g�I4�?@�v� ti�F�99�ɣZ�϶<ca��KP
t3��$���!��}?�ڎ5��G��uU���D,s��J�������kQ(�C��C���4�v���s]�;�u��S{��/k�}��M�C���p�`�eB�K.��s�wz��{�n<J�܆���0�8�b
�wQ����      )   �  x����n1���� �qnK@ �+�BB�v*E*���3�����ٍ��N|�� R`H9���K��۟�����_�����o>`DL3���>ܝ1��ws?����T���#v�ut�q=0sG|j���rD� O߇@�-IL�Ӆ'�K(�q��w{���n�=ԧ�E@̈́$rg[B��-�F,�����YT�<��N����R�|,l1u�8���K��K��V'���j�rNLT��s,�[�07��r�sÊ�>�����:�0�a�Òc��B�e����}Y�, �� -��)1��|�%2G��>=r]�.�O���"#��n.�j	ׄ�r�t6�Mor�T��ܮ��k��}j�m��N1V0Gc��E�B��
�K�hA_%���8*��M�Ӏ�v�M3U�ek�Go3���lV�f'�h��d�H���f��LV]�ĘYsbr��A��[�zL]�%����Z���$����[�?MI��˔�.z����i�b.��֧R�7�>}�06W��'���`��)b\�UAc��	���>�`�h[O���1H�Ibm�;�-�p*��a`�a��-HmRbXM��N��Gɼ/���cJVL��\N�����VFK��R%C�PV�#�V���/���i$D,B7���4��{���>x��,��g��      *      x������ � �      #   V  x�mS�n�@>O�D���rÎc7V"�NZUU/cX;k���@��mz�!�����u0�N�̮0��7���C?��|�ci5����ݾ�g���e���Y�5��RiU�sc!�/��X�8�s8G[�
�h-f�J�{��n`W=|1���ƚ��j�Q�}8�yȓpIy�5X��N���`y>��{?]K��e��/U�V��'d��0���A�^����*
�ܹ*���0�N'ôw2�*�A�!�����ϰiP�!i_��%�tM�}�i�Z���=�8��I�8��,��;L-�LU����L��Ԧ���f+\8Zpλ㩅7��H+�Zc�
�+�WcqZ%�r�!p��V�.,�Tv��R*�7u�����O*�T�C�Oķ0*���sG�φ:T�myJ$�@��t�1A��p���	�+�=q�)�c]ry�]�$%5+���\�ܪu��w[��	t���TG<}8�,�̛��R�����B� ���f%I�*r���G�<F^�ZB3\we��^��h�J�������7:bjt��}qG훱��e g��S��6ݏ5&]���_�,������K����ف����p~�9��W�?w     