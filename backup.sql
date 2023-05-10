PGDMP     "            
        {        
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
    public          postgres    false    220   5       %          0    24629    reparacions 
   TABLE DATA           }   COPY public.reparacions (idreparacio, idequip, datainici, datafi, comentaris, tecnic, comentaritancament, estat) FROM stdin;
    public          postgres    false    217   a5       )          0    24756    reserves 
   TABLE DATA           Z   COPY public.reserves (idreserve, idusuari, setmana, hora, temps, dia, idsala) FROM stdin;
    public          postgres    false    221   +6       *          0    24765    solicitud_reparacio 
   TABLE DATA           N   COPY public.solicitud_reparacio (idsolicitud, idequip, comentari) FROM stdin;
    public          postgres    false    222   H8       #          0    16437    usuaris 
   TABLE DATA           X   COPY public.usuaris (idusuari, nom, cognoms, password, email, rol, telefon) FROM stdin;
    public          postgres    false    215   e8       7           0    0    espais_equips_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.espais_equips_id_seq', 63, true);
          public          postgres    false    219            8           0    0    reparacions_idreparacio_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.reparacions_idreparacio_seq', 32, true);
          public          postgres    false    216            9           0    0    reserves_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.reserves_id_seq', 108, true);
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
       public          postgres    false    218    3211    220            "   �  x����N�0���>E^�]{�|������,ڛD�d�о=�����.�'E��{���0�ٵ�>��`<���zM3L�b��yҙ�*��?��!]�[e"�1J�b��,E�.o��U�2d'ϫ��3߷Ɠd�`2��I䋓�ݡ)�4�IK3��� 0�r���$γ�rPV�d��E+��Lw1�f�si#P�`��k��cV<M�;o�N��QZx���`��|�RBIf/����>2�e���g�I�
FhJ���g���J3{�g�/�]Z-�|��#�C�g�<��)I,��sn 0��q)C��9hwQV�+�����5�����'�<u�1P�i��z2p(����Ί/n红Ih�X��:TrM���J>軴
�Q_�>��ZC7cwF�E��V�$?8χ�����i9����55�������(k1ۣ��j�s�Փ�@":�
�~�U����̈2�P�B�~���Qd�=���C��y��'Ǳ5m�nq��I��6+�V,�`�}gҧ��7�tp~}ӵ�
2�㶻�k���h0m��u�Izi��D
�[��]��p�%=�J	ٌ�a���B�OzV�F�hto�
�����Uh �Z��Һ~����h/�hx�|�T3�*bYo���J4u����Ӯ�	�`6����J��[��y���)      &   �   x�M�=�0D�z�0�;��SpA��6���fS~�{co�O)aa����AC�t���~�~�':���~��_��w�=�A����J���_?���&:3�����J�b�F��~ �*�������Mm      (   ;   x�33�tp�700��	�004�23���Ō��Lb�u�\�&p1c��W� 5��      %   �   x�m���0@��WtsBJ��2���qbp`9��ZJ�����%q�����
N�����9�>�c�c
lI�֦Ei"���k1�3$�Mp���;�k��^ۢ���#�`j����8Ap����[�w|��J����~�EEu�����n>�_���ݘ���L[;T�:�?^�-!�O�T      )     x����j1 ��0E�%�:����Ҵ�R(��!i!�_�d���a=���K�زk��Z�ǀ��^����§/7� B�-d�,�6`�ݿt0V�6�H(R���CH�����kg8�5S:�J(�Qe��a2�8V�<�H����9�F�.-gv��1^@��?�Vr>�ف&*9�毯��t,����[�#�
�h���� ~�!��3�T�����Y�&�"�l�8��ZcS�.}*l1�"�y!7�]��;�����0G�͟�(H��
�����uPW��+��^���Zgr��=�[f��+�)��d��UѨt.㎑�X�\F�.�v�9�*����,
� \Ai����6���pQT���j/�n}k8�����^7W�����x;�*��ԡㆴ6���x�KQq���ҹ��a㙼)���hnnFy�ڒ�%^)��%����)��jo�R�e���T{Y��,�a������R�r����x��W6r���"�Ü����z|����}̩�E����]�����2      *      x������ � �      #   V  x�mS�n�@>O�D���r�Nb7V"�NZUU/cX�k���@��mz�������u0�n�̮0��7���C?��#|�'ci5��͢�پ�W���E���E�5��RiU�sc!�/��X�8�3�D[�
�h-fk��}@��\5
�������ޚ��j�^�C8�yȓpW��0m��ѝ[��|Ȼ��J��"3%<�L��C8!�x���j�mF �UQ`��T)�0+��]z5{jA�4%K|��?¦AO��U=IV�v�K��r���=�OU�VA�B�$I�CQ�&u�����f�r�j���}�%���-8������T��qG�ѕ髱8/��a9�s��+�r�X*{�Z)��M]�*����J;Q�P����
�������N��h[�I,P-%�8bL��%\�^� �{k�G!�7ű�a��)B."��۽��f��<��s�[��P�f��>�N?�5�	ON$�9�&0E�Pd}�3��$�;mj%푡iI�����A=:��Q,��U����}�����=Z��� f"��~�����]�nw�}3v��r�K<��d��Xc�e+����;yȡ�9����8�i99��ۅ�8  ?#     