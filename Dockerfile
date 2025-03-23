#Image nginx
FROM nginx:alpine

# Salin file HTML Anda ke dalam direktori yang digunakan oleh Nginx untuk melayani file statis
COPY . /usr/share/nginx/html

# Step 3: Expose port 80 untuk dapat diakses melalui HTTP
EXPOSE 80

# Jalankan Nginx di foreground (default behavior Nginx sudah cukup)
CMD ["nginx", "-g", "daemon off;"]
