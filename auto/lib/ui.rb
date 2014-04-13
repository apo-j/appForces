module Auto
  module UI
    def get_page_configs(domainName)
      pageConfig = PageConfig.includes({pages: :pageSecurity}).where(domainName: domainName)
      if pageConfig.empty?
        {status: 404}.to_json
      else
        pageConfig[0].to_json({except:[:id, :created_at, :domainName,
                                       :updated_at, :lock_version], methods: :status,
                            include:{pages:{except:[:pageConfig_id, :created_at, :updated_at, :lock_version],
                                            include:{pageSecurity:{except:[:id, :page_id, :created_at, :updated_at, :lock_version]}}}}})
      end
    end
  end
end