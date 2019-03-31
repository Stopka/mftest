<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 22:12
 */

namespace Stopka\MediaFactory\Model\Database\Entities\Properties;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\MultilanguageString;

trait TDescriptionProperty
{
    /**
     * @var MultilanguageString
     * @ORM\OneToOne(targetEntity="MultilanguageString", cascade={"all"}, orphanRemoval=true)
     */
    protected $description;

    public function __construct()
    {
        $this->description = new MultilanguageString();
    }


    /**
     * @return MultilanguageString
     */
    public function getDescription(): MultilanguageString
    {
        return $this->description;
    }
}
